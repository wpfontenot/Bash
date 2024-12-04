#!/bin/bash
#
#
CAT=/bin/cat
DIR=${1}
FILE=${2}
DATE="$(date '+%Y%m%d')"
# SORT="/bin/sort"

BASEDIR=/app/nxlog
LOGDIR="${BASEDIR}"/logs
ARCHIVE=/var/archive/nxlog
ARCHIVEDIR="${ARCHIVE}"/"${DIR}"

rename() {
	mkdir -p "${ARCHIVEDIR}"
	bzip2 -c "${LOGDIR}"/"${DIR}" > "${ARCHIVEDIR}"/"${FILE}"."${DATE}".bz2
	chmod 440 "${ARCHIVEDIR}"/"${FILE}"."${DATE}".bz2
	"${CAT}" /dev/null > "${LOGDIR}"/"${DIR}"
}

rename
