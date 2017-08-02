#!/bin/bash
DEPLOY_DIR=`pwd`
echo "DEPLOY_DIR=$DEPLOY_DIR"
PIDS=`ps -ef | grep java | grep $DEPLOY_DIR |awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo "ERROR: The beast-member already started!"
    echo "PID: $PIDS"
    exit 1
fi

LIB_DIR=$DEPLOY_DIR/lib
echo "lib dir: $LIB_DIR"
MAIN_JARS=`ls $LIB_DIR|grep beast|grep main|grep .jar|awk '{print "'$LIB_DIR'/"$0}'|tr "\n" " "`
echo "main jar: $MAIN_JARS"
nohup java -Xms128m -Xmx1024m -XX:MaxPermSize=64M -jar $MAIN_JARS -console 2>/dev/null >/dev/null &

COUNT=0
while [ $COUNT -lt 1 ]; do
    echo -e ".\c"
    sleep 1
    COUNT=`ps -f | grep java | grep "$DEPLOY_DIR" | awk '{print $2}' | wc -l`
    if [ $COUNT -gt 0 ]; then
        break
    fi
done

echo "OK!"
PIDS=`ps -f | grep java | grep "$DEPLOY_DIR" | awk '{print $2}'`
echo "PID: $PIDS"