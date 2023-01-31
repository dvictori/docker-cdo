FROM ubuntu

# set Embrapa proxy rules
# comment this out if you are not working at Embrapa :)
ENV no_proxy=127.0.0.1,10.129.0.0/16,200.0.70.0/24,2801:80:1400::/48,localhost,.cnptia.embrapa.br,.cnptia.embrapa.gov.br,.sbiagro.org.br,.agritempo.gov.br,.agrolivre.gov.br,.terraclass.gov.br
ENV ftp_proxy=http://proxy.cnptia.embrapa.br:3128/
ENV https_proxy=http://proxy.cnptia.embrapa.br:3128/
ENV FTP_PROXY=http://proxy.cnptia.embrapa.br:3128/
ENV RSYNC_PROXY=http://proxy.cnptia.embrapa.br:3128/
ENV HTTPS_PROXY=http://proxy.cnptia.embrapa.br:3128/
ENV HTTP_PROXY=http://proxy.cnptia.embrapa.br:3128/
ENV http_proxy=http://proxy.cnptia.embrapa.br:3128/
ENV rsync_proxy=http://proxy.cnptia.embrapa.br:3128/


# Install some core software
RUN apt-get update && apt-get install -y wget g++ make \
    && rm -rf /var/lib/apt/lists/*

# Set up the components needed for format support for cdo
RUN apt-get update && apt-get install -y \
    nco netcdf-bin libhdf5-serial-dev zlib1g-dev libnetcdf-dev libproj22 libproj-dev libudunits2-dev\
    && rm -rf /var/lib/apt/lists/*

# Install cdo from source, so that we get other format support
WORKDIR /tmp
RUN wget https://code.mpimet.mpg.de/attachments/download/27276/cdo-2.0.6.tar.gz -O /tmp/cdo-2.0.6.tar.gz \
    && tar -xzvf cdo-2.0.6.tar.gz \
    && cd /tmp/cdo-2.0.6 \
    && ./configure --enable-netcdf4 --enable-szlib --with-netcdf=/usr/ --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serial/ --with-proj=/usr/ --with-szlib=/usr/ --with-udunits2=/usr/ \
    && make \
    && make install \
    && rm -rf /tmp/*

RUN mkdir -p /data && chmod 777 /data
WORKDIR /data

ENTRYPOINT [ "cdo" ]
CMD [ "--version" ]
