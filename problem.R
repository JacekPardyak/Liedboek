
# French locale
Sys.setlocale("LC_ALL", "French")
string <- c("Voyez le brick géant que j'examine près du grand wharf","\n", "Zażółć gęślą jaźń")
cat(string)
# > Voyez le brick géant que j'examine près du grand wharf 
# > Zazólc gesla jazn

# Polish locale
Sys.setlocale("LC_ALL", "Polish")
string <- c("Voyez le brick géant que j'examine près du grand wharf","\n", "Zażółć gęślą jaźń")
cat(string)
# > Voyez le brick géant que j'examine pres du grand wharf 
# > Zażółć gęślą jaźń

# Expected result
# > Voyez le brick géant que j'examine près du grand wharf 
# > Zażółć gęślą jaźń
