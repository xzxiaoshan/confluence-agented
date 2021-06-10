FROM cptactionhank/atlassian-confluence:7.9.3

USER root

# 将代理破解包加入容器
# 设置启动加载代理包
RUN set -x \
&& curl -Ls "https://gitee.com/pengzhile/atlassian-agent/attach_files/283101/download/atlassian-agent-v1.2.3.tar.gz" | tar -xz --directory "/opt/atlassian/confluence" --strip-components=1 --no-same-owner "atlassian-agent-v1.2.3/atlassian-agent.jar" \
&& echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/confluence/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/confluence/bin/setenv.sh
