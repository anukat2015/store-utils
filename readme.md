## Tools to copy Neo4j Stores between versions

Uses the batch-inserter API to read and write the stores keeping the node-ids.
Copies the index-files as is.
Ignores broken nodes and relationships.

Also useful to skip no longer wanted properties or relationships with a certain type. Good for store compaction as it
rewrites the store file reclaiming space that is sitting empty.

It uses local dependency copies in `source-deps` and `target-deps`.

### Store Copy

Usage:

    mvn compile exec:java -Dexec.mainClass="org.neo4j.tool.StoreCopyRevert" \
      -Dexec.args="source:version target:version [rel,types,to,ignore] [properties,to,ignore]"

e.g. 

    mvn compile exec:java -Dexec.mainClass="org.neo4j.tool.StoreCopyRevert" \
      -Dexec.args="test.db:1.9.8 fixed.db:2.0.0 :FOO bar"

Supported versions

* 1.9.8
* 2.0.0
* 2.2.1
* 2.2.0-M03
