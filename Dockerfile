FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL name="sai" organization="qt" project="devops"
ADD  https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip  /nop/nopCommerce_4.60.4_NoSource_linux_x64.zip
WORKDIR /nop
RUN apt install unzip -y && unzip nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN mkdir bin && logs
EXPOSE 5000
CMD ["dotnet","Nop.Web.dll","--urls","http://0.0.0.0:5000"]

