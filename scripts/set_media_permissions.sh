#!/bin/bash
#
BASEDIR=/digitalMedia

cd "${BASEDIR}" || exit

function set_digitalMedia_permissions() {
	FIND=/usr/bin/find

	for dir in anime anime_series home_videos movies music tv_shows vidz
	do
		"${FIND}" "${dir}" -depth -type d -exec chmod 0770 {} \;
		"${FIND}" "${dir}" -depth -type f -exec chmod 0440 {} \;
		"${FIND}" "${dir}" -depth -type d -exec chown -R plex:video {} \;
		# ${FIND} ${dir} -depth -type d -name backdrops -exec chown emby:emby {} \;

		#for file in "*.nfo"
		#do
		#	${FIND} ${dir} -depth -type f -name ${file} -exec chown emby:emby {} \;
		#	${FIND} ${dir} -depth -type f -name ${file} -exec chmod 0640 {} \;
		#done
		
		for file in *.srt
		do
			"${FIND}" "${dir}" -depth -type f -name "${file}" -exec chown plex:video {} \;
			"${FIND}" "${dir}" -depth -type f -name "${file}" -exec chmod 0440 {} \;
		done

		for file in "*.jpg" "*.png" "theme.*"
		do
			"${FIND}" "${dir}" -depth -type f -name "${file}" -exec chown plex:video {} \;
			"${FIND}" "${dir}" -depth -type f -name "${file}" -exec chmod 0440 {} \;
		done

		#for file in "*.jpg" "*.png" "theme.*"
		#do
		#	${FIND} ${dir} -depth -type f -name ${file} -exec chown emby:emby {} \;
		#	${FIND} ${dir} -depth -type f -name ${file} -exec chmod 0440 {} \;
		#done
	done

	for photo_dir in photos/*
	do
		"${FIND}" "${photo_dir}" -depth -type d -exec chmod 0770 {} \;
		"${FIND}" "${photo_dir}" -depth -type f -exec chmod 0440 {} \;
		"${FIND}" "${photo_dir}" -depth -type d -exec chown -R plex:video {} \;
		"${FIND}" "${photo_dir}" -depth -type f -exec chown plex:video {} \;
	done

#	for photo_dir in pauls_photos photos
#	do
#		${FIND} ${photo_dir} -depth -type d -exec chmod 0770 {} \;
#		${FIND} ${photo_dir} -depth -type f -exec chmod 0440 {} \;
#		${FIND} ${photo_dir} -depth -type d -exec chown -R plex:video {} \;
#		${FIND} ${photo_dir} -depth -type f -exec chown plex:video {} \;
#	done
}
#function set_media_permissions() {
#	set_digitalMedia_permissions
#}
set_digitalMedia_permissions