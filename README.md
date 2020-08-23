![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)
[![dependencies status](https://david-dm.org/takahitomiyamoto/flexible-apex-trigger.svg)](https://david-dm.org/takahitomiyamoto/flexible-apex-trigger)
[![devDependency status](https://david-dm.org/takahitomiyamoto/flexible-apex-trigger/dev-status.svg)](https://david-dm.org/takahitomiyamoto/flexible-apex-trigger#info=devDependencies)
[![Code Climate](https://codeclimate.com/github/takahitomiyamoto/flexible-apex-trigger.svg)](https://codeclimate.com/github/takahitomiyamoto/flexible-apex-trigger)

# Flexible Apex Trigger

This is a framework that makes our Apex Trigger development more flexible.

# How to use

## install on your org

```sh
sfdx force:package:install -p flexible-apex-trigger@1.0.1.0 -s AllUsers -u [targetusername]
sfdx force:package:install:report -i 0HfXXXXXXXXXXXXXXX -u [targetusername]
```

## assign a permission set to one or more users of an org

```sh
sfdx force:user:permset:assign -n FAT_Logger_User -u [targetusername]
```

## open an org in your browser

```sh
sfdx force:org:open -p lightning/setup/ImportedPackage/home -u [targetusername]
```

# Acknowledgment

- [Dependency Injection Sample for Apex Trigger](https://github.com/takahitomiyamoto/di-sample-apex-trigger)

---

# Appendix

## 1. Create a package

### 1.1. create a package

```sh
sfdx force:package:create -d "This is a framework that makes our Apex Trigger development more flexible." -e -n "flexible-apex-trigger" -r force-app-fat -t Unlocked -v DevHub
```

### 1.2. create a package version

```sh
sfdx force:package:version:create -a "Summer '20" -b "master" -c -e "Summer '20 (API version 49.0)" -f config/project-scratch-def.json -n 1.0.0.0 -p 0HoXXXXXXXXXXXXXXX -t v49.0 -v DevHub -x --postinstallurl "https://github.com/takahitomiyamoto/flexible-apex-trigger" --releasenotesurl "https://github.com/takahitomiyamoto/flexible-apex-trigger/releases"
```

### 1.3. retrieve details about a package version creation request

```sh
sfdx force:package:version:create:report -i 08cXXXXXXXXXXXXXXX -v DevHub
```

### 1.4. list package version creation requests

```sh
sfdx force:package:version:create:list -s Success -v DevHub
```

### 1.5. promote a package version to released

```sh
sfdx force:package:version:promote -p 04tXXXXXXXXXXXXXXX -v DevHub
```

### 1.6. retrieve details about a package version in the Dev Hub org

```sh
sfdx force:package:version:report -p 04tXXXXXXXXXXXXXXX -v DevHub --verbose
```

### 1.7. list all packages in the Dev Hub org

```sh
sfdx force:package:list -v DevHub --verbose
```

### 1.8. list all package versions in the Dev Hub org

```sh
sfdx force:package:version:list -p flexible-apex-trigger -v DevHub --verbose
```

## 2. Update a package

### 2.1. create a package version

```sh
sfdx force:package:version:create -a "Summer '20" -b "master" -c -e "Summer '20 (API version 49.0)" -f config/project-scratch-def.json -n 1.0.1.0 -p 0HoXXXXXXXXXXXXXXX -t v49.0 -v DevHub-FAT -x --postinstallurl "https://github.com/takahitomiyamoto/flexible-apex-trigger" --releasenotesurl "https://github.com/takahitomiyamoto/flexible-apex-trigger/releases"
```

### 2.2. retrieve details about a package version creation request

```sh
sfdx force:package:version:create:report -i 08cXXXXXXXXXXXXXXX -v DevHub-FAT
```

### 2.3. update a package version

```sh
sfdx force:package:version:update -a "Summer '20" -b "master" -e "Summer '20 (API version 49.0)" -p 04tXXXXXXXXXXXXXXX -t v49.0 -v DevHub-FAT
```

### 2.4. promote a package version to released

```sh
sfdx force:package:version:promote -p 04tXXXXXXXXXXXXXXX -v DevHub-FAT
```

### 2.5. list all package versions in the Dev Hub org

```sh
sfdx force:package:version:list -p flexible-apex-trigger -v DevHub-FAT --verbose
```
