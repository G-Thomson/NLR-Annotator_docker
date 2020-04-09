# NLR-Annotator_docker

Unofficial Docker image for NLR-Annotator

**NLR-Annotator Github repository:** https://github.com/steuernb/NLR-Annotator/tree/nlr_parser3

Note: I am using the nlr_parser3 branch so I can use an updaded verison of MEME as MEME has been updated quite a few times sine the NLR-Annotator release

Intallation of MEME seems to be a little tricky. It is failing one test but I have all the pre-requisite software installed. I don't think it's too big of an issue.

Also I tried to add MEME to the path (see ENV calls) but it didn't work so run the following when you first start it up.

`export PATH=$HOME/meme/bin:$HOME/meme/libexec/meme-5.1.1:$PATH` 

