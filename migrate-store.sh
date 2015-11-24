DB=$1
SOURCE_VERSION=$2
TARGET_VERSION=$3
REL_TYPES=$4
PROP_NAMES=$5

cd source-deps
#mvn dependency:copy-dependencies -Dneo4j.version=$SOURCE_VERSION
cd ..
cd target-deps
#mvn dependency:copy-dependencies -Dneo4j.version=$TARGET_VERSION
cd ..

mvn compile

cd runner

mvn exec:java -Dexec.mainClass="org.neo4j.tool.StoreCopyRevert" \
      -Dexec.args="$DB:$SOURCE_VERSION ${DB}.$TARGET_VERSION:$TARGET_VERSION $REL_TYPES $PROP_NAMES"

cd ..
