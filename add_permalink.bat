@REM rename dir

move .\docs\articles articles_old
move E:\PycharmProjects\WG\note\docs\articles .\docs\articles

npm run build

move .\docs\articles E:\PycharmProjects\WG\note\docs\articles
move articles_old .\docs\articles
