## Requires image magick
function png2icoBatch ()  {
for fname in $1/**/*.png
do

#take off the png
pathAndName=${fname%.png}

#take off the path from the file name
iconname=${pathAndName##*/}

#take off the file name from the path
iconpath=$pathAndName:h

#create new folder for converted icons to be placed in
mkdir -p ${iconpath}/ico-converted/

# The below should take png and convert it to png which basically means resizes it but I'm not sure and I don't want to spend any more time twiddling with this crap. If that doesn't work then just resize or whatever.

svgexport ${fname} ${iconpath}/ico-converted/${iconname}-256tmp.png 256:
svgexport ${fname} ${iconpath}/ico-converted/${iconname}-128tmp.png 128:
svgexport ${fname} ${iconpath}/ico-converted/${iconname}-64tmp.png 64:
svgexport ${fname} ${iconpath}/ico-converted/${iconname}-32tmp.png 32:
svgexport ${fname} ${iconpath}/ico-converted/${iconname}-24tmp.png 24:
svgexport ${fname} ${iconpath}/ico-converted/${iconname}-16tmp.png 16:

 convert \
 ${iconpath}/ico-converted/${iconname}-256tmp.png \
 ${iconpath}/ico-converted/${iconname}-128tmp.png \
 ${iconpath}/ico-converted/${iconname}-64tmp.png \
 ${iconpath}/ico-converted/${iconname}-32tmp.png \
 ${iconpath}/ico-converted/${iconname}-24tmp.png \
 ${iconpath}/ico-converted/${iconname}-16tmp.png \
 -background none ${iconpath}/ico-converted/${iconname}.ico
rm -rf ${iconpath}/ico-converted/*tmp.png


echo "\033[1;33m converted ${iconname}.png to ico\n \033[0m"
done

}
