FROM centos:7

RUN yum -y update
RUN yum -y install centos-release-openstack-train.noarch
RUN yum -y install openstack-dashboard
RUN yum -y install openstack-octavia-ui.noarch openstack-heat-ui.noarch
RUN yum -y install memcached
RUN yum clean all
WORKDIR /usr/share/openstack-dashboard/
RUN python manage.py collectstatic --noinput && python manage.py compress
COPY init.sh /init.sh
COPY local_settings /etc/openstack-dashboard/local_settings
COPY openstack-dashboard.conf /etc/httpd/conf.d/openstack-dashboard.conf
CMD /init.sh
