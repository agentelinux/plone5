FROM sthapaun/centos-emacs
MAINTAINER Sthapaun Patinthu <contact@sthapaun.com>

# Download importance packages then install
RUN yum updata; yum -y install gcc-c++ patch openssl-devel libjpeg-devel libxslt-devel readline-devel make which python-devel; cd ~/Desktop; wget https://launchpad.net/plone/5.0/5.0b3/+download/Plone-5.0b3-UnifiedInstaller.tgz; tar -zxvf Plone-5.0b3-UnifiedInstaller.tgz; mv Plone-5.0b3-UnifiedInstaller plone5; cd plone5; yum install sudo bzip2; sudo ./install.sh zeo;

EXPOSE 8080

CMD "sudo -u plone_daemon /opt/plone/zeocluster/bin/plonectl start"