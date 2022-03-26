##################################################
# global configure
##################################################

def Settings(**kwargs):
	return { 
		"flags": [
            "--std=c++11",
            "-I.",
            "-I~/QQMail/",
            "-I~/QQMail/mm3rd",
            "-I~/QQMail/mm3rd/rapidjson/include/",
            "-I~/QQMail/mm3rd/boost/",
            "-I~/QQMail/mm3rd/curl/include/",
            "-I~/QQMail/mm3rd/hadoop/libhdfs/",
            "-I~/QQMail/mm3rd/jsoncpp/include/",
            "-I~/QQMail/mm3rd/jsoncpp/include/json/",
            "-I~/QQMail/mm3rd/l5client/",
            "-I~/QQMail/mm3rd/mysql/",
            "-I~/QQMail/mm3rd/protobuf/include/",
            "~/project/",
            "-I~/code/leveldb",
            "-I~/code/leveldb/include",
            "-I~/code/rocksdb",
            "-I~/code/hbase",
            "-I~/code/httpproxy",
            "-I~/code/gowork/",
            "-I~/code/",
            "-I~/bigdata/ClickHouse",
            "-I~/bigdata/ClickHouse/src",
            "-I~/bigdata/terarkdb",
            "-I~/bigdata/influxdb/",
            "-I~/bigdata/",
            "-I/usr/include/",
            "-I/usr/local/include/",
        ],
	}

