for url in $(mysql -u root -pnotroot whatisup_development <<< "SELECT url FROM VenuePhoto WHERE base64 IS NULL LIMIT 100;"  | grep "http.*")
do
	base64str=$(curl "http://magickly.jux.com/?src=$url&resize=295x1000" | base64)
	mysql -u root -pnotroot whatisup_development <<< "UPDATE VenuePhoto SET base64=\"$base64str\" WHERE url=\"$url\" AND base64 IS NULL;"
done
