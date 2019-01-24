for f in ./*; do
  case $f in
        *.sql)
              psql -U "$POSTGRES_USER" -d postgres -a -f "$f" \
              && rm -f $f \
              && echo "$(date '+%d-%m-%Y %H:%M:%S'): executing  $f on postgres" >> db_sql-log.log
              ;;
        *)
              echo "ignoring $f"
              ;;
  esac
done
