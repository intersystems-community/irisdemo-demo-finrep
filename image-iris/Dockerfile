FROM intersystemsdc/irisdemo-base-irisint-community:version-1.9.4U

# IRIS Global buffers and Routine Buffers
ENV IRIS_GLOBAL_BUFFERS=2048
ENV IRIS_ROUTINE_BUFFERS=256

# Name of the project folder ex.: my-atelier-project
#ARG IRIS_PROJECT_FOLDER_NAME=iris-opcua-oee
ARG IRIS_PROJECT_FOLDER_NAME=src 

# Adding source code that will be loaded by the installer
ADD --chown=irisowner:irisuser ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

ADD --chown=irisowner:irisuser ./FCASchemas/ /tmp/FCASchemas/
ADD --chown=irisowner:irisuser ./html/fca-logo.jpg /usr/irissys/csp/broker/covers/

# Running the installer. This will load the source from our project.
RUN mv $IRIS_APP_SOURCEDIR/Batch-Batch\ Control\ Record\ Stats /tmp/dfi/ && \
mv $IRIS_APP_SOURCEDIR/FCA-FCA\ Reporting\ Monitoring /tmp/dfi/ && \
mv $IRIS_APP_SOURCEDIR/FCA-Report\ Status /tmp/dfi/ && \
ls -l /tmp/dfi && \
/usr/irissys/demo/irisdemoinstaller.sh 

ADD --chown=irisowner:irisuser ./html/landing-page.png $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD --chown=irisowner:irisuser ./html/landing-page-detailed.png $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD --chown=irisowner:irisuser ./html/image-map-resizer/js/imageMapResizer.min.js $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD --chown=irisowner:irisuser ./html/image-map-resizer/js/imageMapResizer.map $ISC_PACKAGE_INSTALLDIR/csp/user/

# USER root
# RUN echo "vm.nr_hugepages=2056" >> /etc/sysctl.conf  
# USER irisowner