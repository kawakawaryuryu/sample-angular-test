FROM centos:centos7

RUN yum -y install alsa-lib.x86_64 atk.x86_64 cups-libs.x86_64 GConf2.x86_64 gtk3.x86_64 ipa-gothic-fonts libXcomposite.x86_64 libXcursor.x86_64 libXdamage.x86_64 libXext.x86_64 libXi.x86_64 libXrandr.x86_64 libXScrnSaver.x86_64 libXtst.x86_64 pango.x86_64 xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-fonts-cyrillic xorg-x11-fonts-misc xorg-x11-fonts-Type1 xorg-x11-utils && yum update nss -y
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - && yum install -y nodejs
WORKDIR /app
COPY package*.json /app/
RUN npm i
COPY . /app/
# Github ActionsだとGithub ActionsサーバのworkspaceをDocker上のWORKDIRにマウントするため、WORKDIR上で作業した形跡が消えてしまうので、実行時に再度npm installを行っている
CMD ["npm", "i", "&&", "npx", "ng", "test", "--no-watch", "--browsers=ChromeHeadlessCI"]
