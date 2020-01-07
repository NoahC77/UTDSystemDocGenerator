# This is MakeFile is used to generate the documents for a generic UTD HPC system. The template
# is based off of Ganymede"s docs as of 9/23/2019. Firstly the we change directories to the
# ./GanymedeDocs-master directory. Once in that directory we call the sphinx-build MakeFile
# to generate the html. While much substituion is done by rst and sphinx in this step, sphinx doesn"t
# substitute many words in special formatting like bold, italics, and code blocks. To fix this
# problem, this MakeFile substitutes the words within the special formatted protions of the html.

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



# Moving to the GanymedeDocs-master subdirectory to change the toctree title then run sphinx-build
cd GanymedeDocs

# Moving torward index .rst to change toctree title
cd source

# Changing the CBuppersysname var to it's value then go out generate the sphinx-build then change it back to the var
sed -i "s/SPuppersysName/$(echo $SPuppersysName)/g" index.rst

# Changing the names of the rst files to the value of SPuppersysName and making a copy of them
cp ../BaseRSTs/Connecting-To-SPuppersysName.rst Connecting-To-$(echo $SPuppersysName).rst
cp ../BaseRSTs/Moving-Around-SPuppersysName.rst Moving-Around-$(echo $SPuppersysName).rst
cp ../BaseRSTs/Running-Jobs-On-SpuppersysName.rst Running-Jobs-On-$(echo $SPuppersysName).rst
cp ../BaseRSTs/SPuppersysName-Compilers-And-Modules.rst $(echo $SPuppersysName)-Compilers-And-Modules.rst
cp ../BaseRSTs/SPuppersysName-Training-v1.2.rst $(echo $SPuppersysName)-Training-v1.2.rst
cp ../BaseRSTs/SPuppersysName-Space-Constraints.rst $(echo $SPuppersysName)-Space-Constraints.rst
cp ../BaseRSTs/Appendices.rst $(echo $SPuppersysName)-Appendices.rst
cp ../BaseRSTs/SPuppersysName-Application-Specific-Instructions.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst

# Setting Sphinx handled substitutions
sed -i "s/SRuppersysName/$(echo $SRuppersysName)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRsysName/$(echo $SRsysName)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRhostName/$(echo $SRhostName)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRnodecpunum/$(echo $SRnodecpunum)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRnodememnum/$(echo $SRnodememnum)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRcentVer/$(echo $SRcentVer)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRmatlabver/$(echo $SRmatlabver)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRmatlabsitenum/$(echo $SRmatlabsitenum)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRmatlabdist/$(echo $SRmatlabdist)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRdefcomp/$(echo $SRdefcomp)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRdefmpi/$(echo $SRdefmpi)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRadminemail/$(echo $SRadminemail)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRmailinglistaddr/$(echo $SRmailinglistaddr)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRslurmemail/$(echo $SRslurmemail)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRdebugnodenum/$(echo $SRdebugnodenum)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRhomequota/$(echo $SRhomequota)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRhomemax/$(echo $SRhomemax)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRhomerectime/$(echo $SRhomerectime)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRscratchquota/$(echo $SRscratchquota)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRscratchmax/$(echo $SRscratchmax)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRscratchrectime/$(echo $SRscratchrectime)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst
sed -i "s/SRscratchrectime/$(echo $SRscratchrectime)/g" Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst

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
rm -i Connecting-To-$(echo $SPuppersysName).rst Moving-Around-$(echo $SPuppersysName).rst Running-Jobs-On-$(echo $SPuppersysName).rst $(echo $SPuppersysName)-Compilers-And-Modules.rst $(echo $SPuppersysName)-Training-v1.2.rst $(echo $SPuppersysName)-Space-Constraints.rst $(echo $SPuppersysName)-Appendices.rst $(echo $SPuppersysName)-Application-Specific-Instructions.rst

# Changing SPuppersysname's value in the title back to the variable
sed -i "s/$(echo $SPuppersysName)/SPuppersysName/g" index.rst

# Moving back to build's parent directory
cd ..

# Going back to where the main html is stored and replacing the variables (now in build)
cd build
echo 'Performing HTML replacements...'
sed -i "s/CBnetid/$(echo $CBnetId)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CBsysname/$(echo $CBsysName)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
# The one below  catches weird cases where html puts spans between he bracket and the variable name
sed -i "s/CBsysname/$(echo $CBsysName)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CB4sys/$(echo $CBfourLetSysName)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CBuserCompute/$(echo $CBuserCompute)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CBuppersysname/$(echo $SPuppersysName)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CNChapter5.4/$(echo $CNChapter54)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CNChapter5.5.1/$(echo $CNChapter551)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CNChapter5.5.5/$(echo $CNChapter551)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CNChapter5.5.2/$(echo $CNChapter552)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
sed -i "s/CNChapter5.5.3/$(echo $CNChapter553)/g" $(echo $SPuppersysName)-Training-v1.2.html $(echo $SPuppersysName)-Appendices.html $(echo $SPuppersysName)-Application-Specific-Instructions.html Connecting-To-$(echo $SPuppersysName).html $(echo $SPuppersysName)-Compilers-And-Modules.html $(echo $SPuppersysName)-Space-Constraints.html Moving-Around-$(echo $SPuppersysName).html Running-Jobs-On-$(echo $SPuppersysName).html
echo 'HTML replacements finished.'




