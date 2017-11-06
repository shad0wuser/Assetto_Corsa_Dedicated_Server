#!/bin/bash

cd content/tracks
for tracks in *;
do
	echo "Removing existing ui folder for $tracks";
	rm -rdf ../../server/content/tracks/$tracks/ui/;
	echo "Copying ui folder for $tracks";
	rsync -a $tracks/ui/ ../../server/content/tracks/$tracks/ui/;
#	rsync -aR $tracks/ui/ ../../server/content/tracks/;
done

cd ../cars
for cars in *;
do
	echo "Removing skins folder for $cars";
	rm -rdf ../../server/content/cars/$cars/skins/;
	echo "Copying skins directory structure for $cars";
	rsync -a -f"+ */" -f"- *" $cars/skins/ ../../server/content/cars/$cars/skins/;
done
