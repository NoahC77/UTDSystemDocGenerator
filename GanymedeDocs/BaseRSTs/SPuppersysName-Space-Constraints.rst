.. Changelog
   -----------------------------------------------------------------------
   
.. 1.4 - Made top level sections into their own pages including this one
.. 1.3 - Template
	-RST forked. Used to be Ganymede documentation, now used for generating all kinds of system docs
.. 1.2.2 - Add AUG
	-Add Acceptable User Guidelines section
	-Add AUG pdf
	-Add Acceptable User Guidelines hyperlink to pdf
.. 1.2.1 - Compiled with Sphinx
   -Spell correction
   -Added css files to _static in sphinx
   -Added introduction paragraph to 4.2 header

.. 1.2 - Steves Onboarding Updates
   -Spell correction
   -Blurb about CPU core math
   -srun queue info added
   -Added commands to appendix A (appendix v2.0)
   -Updated variables
   
.. 1.1.1 - Mail issues
   - Updated user docs to have the mailto part. 
.. 1.1 - Fixed Issues
   - Updated UTD admin var
   - Added MPI debugging section
   - Added Ganymede Specific section
   - Added show swap mpi
   - Added default vars
.. 1.0 - First Release
   - Minor grammar edits
   - Hid items that aren't live
   - Added Slurm Commands
.. 0.9 - Visual Impovements
   - Fixed pictures to run 
   - Updated Stylesheets to be UTD! Woosh!
   - Created Matlab Section
   - Updated Slurm added inteactive jobs
   - fixed variables
   - added variables for Matlab section
.. 0.8 
   - Fixed Grammatical Error
   - Fixed unicode dashes
   - Added very basic Appendix A
   - Created HTML Documentation using Sphinx
.. 0.7
   - Changed Run Example to Serial and added Parallel 
   - Added scp and rsync
   - Fixed folder locations
   - Fixed quota names
   - Fixed numbers and title capitalization
   - Minor Grammatical edits
   - Added Appendix B - Slurm Commands
.. 0.6
   - built the sections on compilers, modules, and how to run jobs
   - added email and admin variable sections
.. 0.5
   - built out the documentation tree to include 
       - sections space constraints, 
       - compilers and modules, 
       - running jobs, 
       - application specific
   - wrote section 3 on space constraints
   - added variables for the sec 3 tables
.. 0.4
   - Changed from Word Doc to reStructuredText
   - Set Up Automated Feilds
   - Minor Grammatical Edits
.. 0.3
   - Completely created a basic Linux users guide
   - Made minor edits
   - Created heading structure and began reorganization of document
   - Created table of contents
.. 0.2
   - Major Grammar Edits
   - Removed references to 'dead' items
.. 0.1
   - Original version
   
  .. these are the predefined values
   -------------------------------
.. hpc system params
   
.. systemName should just replace mentions of the system's name not including things like domain
.. or user names in code blocks that are upper case of course
.. |systemName| replace:: SRuppersysName

.. systemNameLower should just replace mentions of the system's name that are lower case, not including
.. things like domain or user names in code blocks
.. |systemNameLower| replace:: SRsysName
.. 
.. |hostName| replace:: SRhostName

.. |nodecpunum| replace:: SRnodecpunum
.. |nodememnum| replace:: SRnodememnum
.. |centVer| replace:: SRcentVer

.. |matlabver| replace:: SRmatlabver
.. |matlabsitenum| replace:: SRmatlabsitenum
.. |matlabdist| replace:: SRmatlabdist

.. |defcomp| replace:: SRdefcomp
.. |defmpi| replace:: SRdefmpi

.. admin params
.. |adminemail| replace:: SRadminemail
.. |mailinglistaddr| replace:: SRmailinglistaddr
.. |slurmemail| replace:: SRslurmemail
.. |debugnodenum| replace:: SRdebugnodenum

.. space limits
.. |homequota| replace:: SRhomequota
.. |homemax| replace:: SRhomemax
.. |homerectime| replace:: SRhomerectime
.. |scratchquota| replace:: SRscratchquota
.. |scratchmax| replace:: SRscratchmax
.. |scratchrectime| replace:: SRscratchrectime

3 - |systemName| Space Constraints
//////////////////////////////////

One of the important considerations in High Performance Computing is the amount of space that is allocated to each user.  The |systemName| cluster is space allocated to provide the maximum amount of space while still providing desirable attributes to the cluster user.

3.1 - Types of Space
********************

There are currently 2 types of space available to the user, home space and scratch space. Home space is located in the ``/home/$USER`` folder and the scratch folder is located in the ``/petastore/CBsysname/scratch/$USER`` folder. For convenience, the scratch folder is symbolically linked inside the user's home folder in ``/home/$USER/scratch`` The following table compares the attributes of the two available spaces.

+------------+-------------------+-----------------------+
| Attributes |     Home Space    |     Scratch Space     |
+============+===================+=======================+
| Purpose of | To house scripts, | To have a large area  |
| the Space  | source code and   | for working with data |
|            | output data.      | or trying ideas       |
+------------+-------------------+-----------------------+
| Backed Up  |        Yes        |           No          |
+------------+-------------------+-----------------------+


3.2 - Space Policies
********************

In addition to the attributes listed above, there are space considerations that need to be addressed due to limited storage.  Each of the users must stay within a certain quota. Should the quota be exceeded, the user will be warned by the following statement : ``dm-0: warning, user block quota exceeded.``  The user will not loose data, but instead is given a short period of time to comply to the block quota.  If the user runs a process that exceeds the Hard Limit, then the process will be stopped and the user will get the following error : ``dm-0: write failed, user block limit reached.``  The following table compares the different space limitations that exist on the particular 

+------------------+---------------+------------------+
| Attributes       |   Home Space  |   Scratch Space  |
+==================+===============+==================+
|   Hard Limit     | |homequota|   | |scratchquota|   |
+------------------+---------------+------------------+
|   Soft Limit     | |homemax| [*]_| |scratchmax| [*]_|
+------------------+---------------+------------------+
| Days to Comply   | |homerectime| | |scratchrectime| |
+------------------+---------------+------------------+

.. [*] The scratch space is located in ``/petastore/CBsysname/scratch/$USER`` but does not count against the storage in the home space, even with the symbolic link.

.. [*] While the petabyte storage device is not metered, the scratch space should be cleaned up when a project is finished to ensure that there is enough room for others interested in using the space.

3.2.1 - Visualizing your scratch space usage
--------------------------------------------

This section was heavily inspired/copied from [here]_.

We now have a utility which will allow you to visualize your scratch
space usage. The first step in using this tool can be time-consuming and
will cause heavy filesystem usage so please do so sparingly.

The command used to generate this information is called **agedu** and
you can view the man page by running ``man agedu``.

The first step is to create the index file::

  cd $HOME/scratch
  agedu -s $HOME/scratch

.. note:: If you have a large number of files in your scratch directory,
   please use the following instead::

     ionice -c3 nice -n 19 agedu -s $HOME/scratch

This will create an inventory of your scratch directory. It will create
a file agedu.dat. This can take several minutes depending on the number
of files you have in scratch.

Please delete your inventory file, $HOME/scratch/adedu.dat, after you
are done with it. These files can be large and become useless once you
have modified your directory. The file is binary and can be used as
discussed below.

Once the inventory is created there are many options for displaying the
data. You can:

- Filter by age
- Create a text file report
- Create a static HTML page that can be viewed offline
- Create a navigable web page that can show subdirectories

Here are some examples of generating a text report filtering by age. The
first column is the amount of data in kilobytes in the given directory
of that age or older.

.. [here] http://geco.mines.edu/prototype/How_do_I_see_scratch_usage/

3.2.1.1 - Find data over 2 years old
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  agedu -a 2y -f $HOME/scratch/agedu.dat -t $HOME/scratch

3.2.1.2 - Find data over 1 year old
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  agedu -a 1y -f $HOME/scratch/agedu.dat -t $HOME/scratch

3.2.1.3 - Find data over 1 month old
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  agedu -a 1m -f $HOME/scratch/agedu.dat -t $HOME/scratch

3.2.1.4 - Find data over 9 months old in subdirectory foo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  agedu -a 9m -f $HOME/scratch/agedu.dat -t $HOME/scratch/foo

3.2.1.5 - Create a static web page for offline viewing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  agedu -a 1y -f $HOME/scratch/agedu.dat -H $HOME/scratch > agedu.html

You can then copy the ``agedu.html`` file to your local machine for
viewing. This will give you a static top level view of your directory
structure.

3.2.1.6 - Create a navigable web page
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Maybe the most useful option is to create a navigable web page that
allows you to dive into subdirectories. When the page is created you
can view your directory as a tree structure and navigate to see the size
and ages of directories and files.

The following needs to be run on a machine with a graphical interface so
you will be able to view the results via a web browser. You can use a
graphical login node--x2go.ganymede.utdallas.edu for example--to run
this command and browse the results.

::

  agedu -a 2y -f $HOME/scratch/agedu.dat -w --address localhost --auth basic

This command will block until you do a Control-C. The command shows a
user name: agedu, a password and a URL. Agedu actually starts a mini
web server. It will display your data via the given URL. You will need
to enter the requested username and password.

.. note:: The navigable web page is not updated automatically if you
   delete files. In order to update the web page, you will need to
   regenerate your ``agedu.dat`` file.

.. important:: Please remember to delete your inventory file
   ``$HOME/scratch/agedu.dat`` when you are finished.


3.3 - Checking Available Space
******************************

The user should be aware of the amount of free space that is remaining, in order to ensure that the user does not run out of space for data during a run of a program or module.  In order to check the amount of space, the user needs to check the ``quota``. ::

  [CBnetid@CBsysname~]$ quota -s
  Disk quotas for user jxw150830 (uid 532471):
       Filesystem   space   quota   limit   grace   files   quota   limit   grace
  /dev/mapper/volgroup0-lvolexport
                      44K  20000M  30000M              11       0       0

In the case above, the entire 20 GB is available to be used.  After running a couple of processes, the ``/home`` space is filled above the quota. ::

  [CBnetid@CBsysname~]$ quota -s
  Disk quotas for user jxw150830 (uid 532471):
       Filesystem   space   quota   limit   grace   files   quota   limit   grace
  /dev/mapper/volgroup0-lvolexport
                   22529M* 20000M  30000M   6days      13       0       0

Note that the number of days in the grace period will slowly go down until the user is out of compliance completely.  At this point, if the amount of time runs out, the user will no longer be able to write new data until they move below the |homequota| threshold.  If at any point the user goes above |homemax|, the user will immediately loose the ability to write until the ``/home`` directory is brought back into compliance.
