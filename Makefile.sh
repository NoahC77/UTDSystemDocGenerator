# This is MakeFile is used to generate the documents for a generic UTD HPC system. The template
# is based off of Ganymede"s docs as of 9/23/2019. Firstly the we change directories to the
# ./GanymedeDocs-master directory. Once in that directory we call the sphinx-build MakeFile
# to generate the html. While much substituion is done by rst and sphinx in this step, sphinx doesn"t
# substitute many words in special formatting like bold, italics, and code blocks. To fix this
# problem, this MakeFile substitutes the words within the special formatted protions of the html.
stringOfRSTNames=' SPuppersysName-Training-v1.2.rst Connecting-To-SPuppersysName.rst Moving-Around-SPuppersysName.rst SPuppersysName-Compilers-And-Modules.rst Running-Jobs-On-SPuppersysName.rst SPuppersysName-Application-Specific-Instructions.rst SPuppersysName-Space-Constraints.rst Appendices.rst'
replaceAndCopyBaseRSTStatus=' '
sphinxSubSetupStatus=' '
arrayOfDerectives=( SRuppersysName SRsysName SRhostName SRnodecpunum SRnodememnum SRcentVer SRmatlabver SRmatlabsitenum SRmatlabdist SRdefcomp SRdefmpi SRadminemail SRmailinglistaddr SRslurmemail SRdebugnodenum SRhomequota SRhomemax SRhomerectime SRscratchquota SRscratchmax SRscratchrectime )
arrayOfHTMLDerective=( CBnetid CBsysname CBsysname CB4sys CBuserCompute CBuppersysname 'CBChapter5.4' 'CNChapter5.5.1' 'CNChapter5.5.5' 'CNChapter5.5.2' 'CNChapter5.5.3' )


# Sets Sphinx handled replacements
SRuppersysName="Ganymede"
SRsysName="ganymede"
SRhostName="@ganymede.utdallas.edu"

SRnodecpunum='4008'
SRnodememnum='14 TB'
SRcentVer='7.5'

SRmatlabver='r2018a'
SRmatlabsitenum='12,000'
SRmatlabdist='32'

SRdefcomp='\*\*Intel\*\*'
SRdefmpi='\*\*mvapich\*\*'

# Sets sphinx handled admin param replacements
SRadminemail='ganymedeadmins@utdallas.edu'
SRmailinglistaddr='ganymedeusers@lists.utdallas.edu'
SRslurmemail='slurm@ganymede.utdallas.edu'
SRdebugnodenum='2'

# Sets sphinx handled space limits replacements
SRhomequota='20 GB'
SRhomemax='30 GB'
SRhomerectime='7 Days'
SRscratchquota='None'
SRscratchmax='None'
SRscratchrectime='N/A'

# Here you can set the substitutions that sphinx won"t do these include system specific words within special formatting like codeblocks
CBnetId="jxw150830"
CBsysName="ganymede"
CBuserCompute="jxw150830"
SPuppersysName="Ganymede"
CBfourLetSysName="gany"


# Replaceable compute nodes
CNChaper54="compute-6-9-0"
CNChapter551="compute-6-9-35"
CNChapter552="compute-6-9-2"
CNChapter553="compute-7-6-4"

# A function used to set the substitutions sphinx didn't handle ***WARNING***: THIS FUNCTION 
# ASSUMES IT IS WITHIN THE DIRECTORY /UTDSystemDocGenerator/GanymedeDoc/build MAKE SURE IT 
# IS THERE.
nonSphinxSubs () {

   for i; do

	for j in "${arrayOfHTMLDerectives[@]}"; do

	    i="${i// \*\.rst/ \*\.html}"
	    echo "i = $i"
                sed -i "s/$j/${!j}/g" $i

	done

   done

}

# A function used to set the sphinx handled substitutions ***WARNING***: THIS FUNCTION ASSUMES IT
#IS WITHIN THE DIRECTORY /UTDSystemDocGenerator/GanymedeDocs/source MAKE SURE IT IS THERE.
sphinxSubSetup () {

   for i; do
        
	for j in "${arrayOfDerectives[@]}"; do
		
            sed -i "s/$j/${!j}/g" $i 

	done

   done
}

# A function used to replace the names of BaseRST if they contain a replacement directive or just
#make a new copy of the file in the appropriate directory. ***WARNING***: THIS FUNCTION ASSUMES IT
#IS WITHIN THE DIRECTORY /UTDSystemDocGenerator/GanymedeDocs/source MAKE SURE IT IS THERE.
replaceAndCopyBaseRST () {
  

    local oldNameHold=' ' 
	
    for i; do	
	 oldNameHold=${i}
	 i="${i//SPuppersysName/${SPuppersysName}}"
	 cp ../BaseRSTs/${oldNameHold} ${i}
	 printf " %s" "${i}"
    done

}
# Moving to the GanymedeDocs-master subdirectory to change the toctree title then run sphinx-build
cd GanymedeDocs

# Moving torward index .rst to change toctree title
cd source

# Changing the CBuppersysname var to it's value then go out generate the sphinx-build then change it back to the var
sed -i "s/SPuppersysName/$(echo $SPuppersysName)/g" index.rst

replaceAndCopyBaseRSTStatus=$(replaceAndCopyBaseRST ${stringOfRSTNames})
sphinxSubSetupStatus=$(sphinxSubSetup${replaceAndCopyBaseRSTStatus})
cd ..

# Before generating the new htmls, the old ones are deleted
cd build
rm -i *.html
cd ..

# Running the sphinx-build command to build the html into the /build directory one level up
sphinx-build -b html ./source ./build

# Moving back to index.rst to change it back to var
cd source

# Deleting rst copies
echo 'Deleting RST copies...'
replaceAndCopyBaseRSTStatus=${replaceAndCopyBaseRSTStatus:1}
rm ${replaceAndCopyBaseRSTStatus}

# Changing SPuppersysname's value in the title back to the variable
sed -i "s/$(echo $SPuppersysName)/SPuppersysName/g" index.rst

# Moving back to build's parent directory
cd ..

# Going back to where the main html is stored and replacing the variables (now in build)
cd build
echo 'Performing HTML replacements...'
sphinxSubSetupSats=$(nonSphinxSubs ${stringOfRSTNames})
echo 'HTML replacements finished.'




