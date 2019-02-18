#!/bin/bash

# ��ȡ��ǰ�����գ�����ʱ��ƥ���´�����������
DATE_LOG=`env LANG=en_US.UTF-8 date '+%d/%b/%Y'`;

# ����������nginx������־������־��Ϣ�Ĺؼ���
FILLTER_404_URL="***";
# �������ķ�����nginx��־
LOG_FILE="***/logs/***_access.log"

# �޳��Լ��ķ�����ip
EXCLUDE_IP1="***";
EXCLUDE_IP2="***";
EXCLUDE_IP3="***";
EXCLUDE_IP4="***";
EXCLUDE_IP5="***";
EXCLUDE_IP6="***";
EXCLUDE_IP7="***";
EXCLUDE_IP8="***";
EXCLUDE_IP9="***";

# ���ɺ����������ļ�
LOCK_FILE="***/conf/vhost/lockip.conf";

# ����nginx��Ч
RELOAD_COMMAD="***/sbin/nginx -s reload";

# ����ʱ��ͳ�Ʒ���Ƶ�νϸߵ�ip
grep "${DATA_LOG}" "${LOG_FILE}" |grep -i -v -E "${EXCLUDE_IP1}|${EXCLUDE_IP2}|${EXCLUDE_IP3}|${EXCLUDE_IP4}|${EXCLUDE_IP5}|${EXCLUDE_IP6}|${EXCLUDE_IP7}|${EXCLUDE_IP8}" | awk '{print $1,$12}' | awk '{print $1}'|sort|uniq -c|sort -rn |awk '{if($1>1000)print "deny "$2";"}' >> "${LOCK_FILE}" 

# ���ݱ������Ľӿ�ͳ�Ʒ���Ƶ�νϸߵ�ip
grep "${FILLTER_404_URL}" "${LOG_FILE}" |grep -i -v -E "${EXCLUDE_IP1}|${EXCLUDE_IP2}|${EXCLUDE_IP3}|${EXCLUDE_IP4}|${EXCLUDE_IP5}|${EXCLUDE_IP6}|${EXCLUDE_IP7}|${EXCLUDE_IP8}" | awk '{print $1,$12}' | awk '{print $1}'|sort|uniq -c|sort -rn |awk '{if($1>1000)print "deny "$2";"}' >> "${LOCK_FILE}"

# ����nginx��Ŀǰע�ͣ�Ҳ���Դ򿪣�������Ӱ�����
#`${RELOAD_COMMAD}`
