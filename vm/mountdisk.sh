#!/bin/bash
while [ `ls -l /dev/disk/azure/scsi1 | grep lun10 | wc -l` -lt 1 ]; do echo waiting on disks...; sleep 5; done
str=$(ls -l /dev/disk/azure/scsi1 | grep lun10)
drive=${str: -1}
#drive="c"
sudo parted /dev/sd${drive} --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs /dev/sd${drive}1
sudo partprobe /dev/sd${drive}1
sudo mkdir -p /datadrive
sudo mount /dev/sd${drive}1 /datadrive
sudo echo UUID=\"`(blkid /dev/sd${drive}1 -s UUID -o value)`\" /datadrive       xfs     defaults,nofail         1       2 >> /etc/fstab
sudo chown azureuser:azureuser /datadrive

cd /datadrive; wget "https://naiglobalstrg.blob.core.windows.net/psfiles/all.tar.gz"; tar xf all.tar.gz
cd /datadrive/; wget "https://sinkstrgadf.blob.core.windows.net/sink/bashrc_set2.sh"
cd /datadrive/; wget "https://sinkstrgadf.blob.core.windows.net/sink/extractfile_mani.sh"


cd /datadrive/; chmod -R 777 extractfile_mani.sh; ./extractfile_mani.sh
sleep 5

echo '##' >> ~/.bashrc
echo '#Mongob' >> ~/.bashrc
echo 'export NODE_HOME=/datadrive/node-v12.18.2-linux-x64' >> ~/.bashrc
echo 'export PATH=$PATH:$NODE_HOME/bin' >> ~/.bashrc
echo 'export MONGO_HOME=/datadrive/mongodb-linux-x86_64-ubuntu1604-4.2.8' >> ~/.bashrc
echo 'export PATH=$PATH:$MONGO_HOME/bin' >> ~/.bashrc

echo '##' >> ~/.bashrc

echo '#JAVA' >> ~/.bashrc
echo 'export JAVA_HOME=/datadrive/jdk1.8.0_144' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin/' >> ~/.bashrc


echo '##' >> ~/.bashrc

echo '#HADOOP' >> ~/.bashrc
echo 'export HADOOP_HOME=/datadrive/hadoop-2.8.1' >> ~/.bashrc
echo 'export HADOOP_PREFIX=$HADOOP_HOME' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$JAVA_HOME/bin:$HADOOP_HOME/bin' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> ~/.bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native' >> ~/.bashrc
echo 'export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"' >> ~/.bashrc
echo '# -- HADOOP ENVIRONMENT VARIABLES END -- #' >> ~/.bashrc

echo '##' >> ~/.bashrc

echo '#Spark' >> ~/.bashrc
echo 'export SPARK_HOME=/datadrive/spark-2.4.5-bin-hadoop2.7' >> ~/.bashrc
echo 'export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$PYTHONPATH' >> ~/.bashrc
echo 'export PATH=$SPARK_HOME/bin:$SPARK_HOME/python:$PATH' >> ~/.bashrc
echo '#export PATH=$SPARK_HOME/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc

echo '##' >> ~/.bashrc
echo '##### KAFKA ########' >> ~/.bashrc
echo 'export PATH=$PATH:/datadrive/kafka_2.12-2.6.0/bin' >> ~/.bashrc
echo 'export KAFKA_HOME=/datadrive/kafka_2.12-2.6.0' >> ~/.bashrc


sleep 3
source ~/.bashrc
sleep 30

cd /datadrive/; chmod -R 777 es.sh; ./es.sh
cd /datadrive/; chmod -R 777 Kafka_Setup_Script.sh; ./Kafka_Setup_Script.sh
cd /datadrive/; chmod -R 777 jupyter.sh; ./jupyter.sh
cd /datadrive/; chmod -R 777 python_R_sap.sh; ./python_R_sap.sh
cd /datadrive/; chmod -R 777 Drool_Step_2.sh; ./Drool_Step_2.sh
#sed -i 's/10.2.0.7/'172.16.1.68'/g' /datadrive/all_tomcat/apache-tomcat-drools-8.5/bin/setenv.sh
#cd /datadrive/all_tomcat/apache-tomcat-drools-8.5/bin; ./startup.sh

cd /datadrive/; chmod -R 777 mongod.sh; ./mongod.sh
cd /datadrive/; chmod -R 777 install_hadoop.sh; ./install_hadoop.sh
#cd /datadrive/; git clone -b nai_4.2 https://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@github.com/tarun-nt/intelligent_front.git;
#cd /datadrive/; chmod -R 777 ui_setup.sh; ./ui_setup.sh
cd /datadrive/; chmod -R 777 nginx.sh; ./nginx.sh
cd /datadrive/; chmod -R 777 monitoringAndSAS.sh; ./monitoringAndSAS.sh
