SUMMARY = "PostgreSQL full feature set"

inherit packagegroup

RDEPENDS:${PN} = " \
    postgresql \
    postgresql-contrib \
    postgresql-client \
    postgresql-server-dev \
    postgresql-test \
"
