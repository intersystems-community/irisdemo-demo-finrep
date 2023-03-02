FROM intersystemsdc/irisdemo-base-irisint-community:version-1.10.5U

# IRIS Global buffers and Routine Buffers
ENV IRIS_GLOBAL_BUFFERS=2048
ENV IRIS_ROUTINE_BUFFERS=256

# Name of the project folder ex.: my-atelier-project
#ARG IRIS_PROJECT_FOLDER_NAME=iris-opcua-oee
ARG IRIS_PROJECT_FOLDER_NAME=src

USER irisowner

# Adding source code that will be loaded by the installer
ADD --chown=irisowner:irisowner ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

ADD --chown=irisowner:irisowner ./FCASchemas/ /tmp/FCASchemas/
ADD --chown=irisowner:irisowner ./html/fca-logo.jpg /usr/irissys/csp/broker/covers/

#Phil Change To add new hyperledger pex adapter 
ADD --chown=irisowner:irisowner ./hyperledger-pex-adapter.jar /hyperledger/hyperledger-pex-adapter.jar

# Running the installer. This will load the source from our project.
RUN mv $IRIS_APP_SOURCEDIR/Batch-Batch\ Control\ Record\ Stats /tmp/dfi/ && \
mv $IRIS_APP_SOURCEDIR/FCA-FCA\ Reporting\ Monitoring /tmp/dfi/ && \
mv $IRIS_APP_SOURCEDIR/FCA-Report\ Status /tmp/dfi/ && \
ls -l /tmp/dfi && \
/demo/irisdemoinstaller.sh

ADD --chown=irisowner:irisowner ./html/landing-page.png $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD --chown=irisowner:irisowner ./html/landing-page-detailed.png $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD --chown=irisowner:irisowner ./html/image-map-resizer/js/imageMapResizer.min.js $ISC_PACKAGE_INSTALLDIR/csp/user/
ADD --chown=irisowner:irisowner ./html/image-map-resizer/js/imageMapResizer.map $ISC_PACKAGE_INSTALLDIR/csp/user/