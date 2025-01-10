Dism /Online /Disable-Feature /Featurename:Recall
Dism /Online /Get-Featureinfo /Featurename:Recall

#You may want to run this at every startup using Task Scheduler. It is not known if Microsoft will re-enable it after updates.