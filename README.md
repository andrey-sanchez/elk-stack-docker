# ELK Stack Docker Artifact
Artefacto para desplegar el stack ELK (elasticsearch, logstash y kibana) como contenedores docker en Cloudia, instala docker-ce utilizando apt y docker-compose utilizando pip.

### Versión 1.0
Artefacto para desplegar:
- Nexus Prod: `com.despegar.customize:elk-stack-docker:1.0`
- Nexus Dev: `com.despegar.p13n:elk-stack-docker:1.0`

### Versión de las imágenes:
- elasticsearch-oss:6.3.0
- logstash-oss:6.3.0
- kibana-oss:6.3.0
- Curator:5.5.4

### Puertos:
- Kibana: 9290
- Logstash:
   - TCP:
     - 4560 (codec json_lines)
     - 5000 (codec line)
   - UDP:
     - 5001 (codec plain)
- Elasticsearch: 9200, 9300
