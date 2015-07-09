FROM ubuntu
MAINTAINER Eran <eran@streamrail.com> 

WORKDIR aws-scripts-mon

RUN apt-get update && \
  apt-get install -y unzip && \
  apt-get install -y libwww-perl libdatetime-perl wget && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip && \
  unzip CloudWatchMonitoringScripts-1.2.1.zip && \
  rm CloudWatchMonitoringScripts-1.2.1.zip

ADD awscreds.conf /etc/awscreds.conf

ADD run.sh run.sh

CMD ./run.sh

#CMD ./mon-put-instance-data.pl \
#  --mem-util --mem-used --mem-avail \
#  --disk-path=/ --disk-space-util --disk-space-avail --disk-space-used \
#  --aws-credential-file=/etc/awscreds.conf
