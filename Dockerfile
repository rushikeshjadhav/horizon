FROM centos:7
MAINTAINER rushikesh7@gmail.com

RUN yum -y update
RUN yum -y install centos-release-openstack-train.noarch
RUN yum -y install openstack-dashboard
RUN yum -y install memcached
RUN yum clean all
COPY init.sh /init.sh
COPY local_settings /etc/openstack-dashboard/local_settings
COPY openstack-dashboard.conf /etc/httpd/conf.d/openstack-dashboard.conf
CMD /init.sh
