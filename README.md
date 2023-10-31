# soundgrade

A new Flutter project.

## Getting Started

## How to push your changes
 * Check you're in development branch.
 * Pull the previous changes from the origin. Use the following command:
 ```shell
 git pull
 ```
 * Create a new branch. You can use
 ```shell
 git checkout -b branch_name
 ```

 or

 ```shell
 git branch branch_name
 git checkout branch_name
 ```
 
 * Add the needed changes. Use the following command.
 ```bash
 git add .
 ```
 * Commit your changes. Add the message directly from the terminal with the following command:
 ``` bash
 git commit -m "Add a commit message"
 ```
 * Checkout to development branch.
 ```bash
 git checkout development
 ```
 * Merge your changes.
 ```bash
 git merge branch_name
 ```
 * Push your changes to development origin.
 ```bash
 git push
 ```

### Adding other changes in your branch.
If you pulled other changes in development branch:
* Verified if there is more changes:
```bash
git checkout development
git pull
```

* Checkout to your branch
```bash
git checkout branch_name
```

* Rebase other changes
```bash
git rebase development
```