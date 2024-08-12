# show config files postgres
sudo -u postgres psql -c "show config_file;"

#======================= edit pg_hba.conf ==================================
# add to end file 
# host    all             new_pg_user      0.0.0.0/32              md5

#======================= edit postgresql.conf ==============================

