# DataScience2Spring2023
Public repo for the Collective Intelligence Masters module, DataScience, Programming, and Statistics 2.

**Before each class, remember to run:**

    git fetch
    git pull
    
to ensure your local version is up to date with the main repo.

Checkout a new branch before you save any changes (e.g. the lab file) using:

    git checkout -b <newbranchname>

Then publish that branch on github using
    
    git push -u origin <newbranchname>
    
When working on a lab file, remember to add your name to the filename before saving.

Remember to run 

    git add <filename_or_directory>
    git commit -am "commit message"
    git push origin <newbranchname>

to commit all your saved changes to the branch.

When you have saved changes to the repo on your branch initiate a pull request (https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)

**First week instructions** 

1. Install R (https://cloud.r-project.org/)
2. Install RStudio (https://posit.co/download/rstudio-desktop/)
3. Install Git (https://happygitwithr.com/install-git.html). Check to see if git works in Rstudio by writing:

        git --version
 
in the terminal.

4. Create a Github account (https://github.com/join)
5. Link your Github account to git in the RStudio terminal:

        git config --global user.name 'Firstname Lastname'
        git config --global user.email 'your.email@example.com'

6. Set your working directory to a path where you would be happy downloading this repository, for example:

        cd C:\repositories
    
7. Clone this repository:

        git clone https://github.com/edseab/DataScience2Spring2023
    
**That's it, you're done! Follow the instructions above for how to update the repo before each class and submit code written in the labs.**
