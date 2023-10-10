# Домашнее задание к занятию 9 «Процессы CI/CD»

## Подготовка к выполнению

1. Создайте два VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).
2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.

**VM в Yandex Cloud разворачиваются по средствам terraform, создаётся динамический hosts-файл:**
<p align="center">
  <img width="1200 height="600" src="./scr/hosts.png">
</p>

3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.
4. Запустите playbook, ожидайте успешного завершения.
5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).
6. Зайдите под admin\admin, поменяйте пароль на свой.
<p align="center">
  <img width="1200 height="600" src="./scr/sonarqube.png">
</p>

7. Проверьте готовность Nexus через [бразуер](http://localhost:8081).
8. Подключитесь под admin\admin123, поменяйте пароль, сохраните анонимный доступ.
<p align="center">
  <img width="1200 height="600" src="./scr/nexus.png">
</p>

## Знакомоство с SonarQube

### Основная часть

1. Создайте новый проект, название произвольное.
2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.
3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
4. Проверьте `sonar-scanner --version`.
<p align="center">
  <img width="1200 height="600" src="./scr/sonar-scanner.png">
</p>

5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.
<p align="center">
  <img width="1200 height="600" src="./scr/sonar-scanner1.png">
</p>
<p align="center">
  <img width="1200 height="600" src="./scr/sonar-scanner2.png">
</p>

6. Посмотрите результат в интерфейсе.
<p align="center">
  <img width="1200 height="600" src="./scr/sonar-scanner3.png">
</p>

7. Исправьте ошибки, которые он выявил, включая warnings.
```python
def increment(index = 0):
    index += 1
    return index
def get_square(numb):
    return numb*numb
def print_numb(numb):
    print("Number is {}".format(numb))

index = 0
while (index < 10):
    index = increment(index)
    print(get_square(index))
```

8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.
9.  Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.
<p align="center">
  <img width="1200 height="600" src="./scr/sonar-scanner4.png">
</p>

## Знакомство с Nexus

### Основная часть

1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.

<p align="center">
  <img width="1200 height="600" src="./scr/nexus-8_282.png">
</p>

2. В него же загрузите такой же артефакт, но с version: 8_102.
3. Проверьте, что все файлы загрузились успешно.

<p align="center">
  <img width="1200 height="600" src="./scr/nexus-8_102.png">
</p>

4. В ответе пришлите файл `maven-metadata.xml` для этого артефекта.\
**[maven-metadata.xml](./maven-metadata.xml)**

### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).
2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.
4. Проверьте `mvn --version`.
<p align="center">
  <img width="1200 height="600" src="./scr/mvn-version.png">
</p>

5. Заберите директорию [mvn](./mvn) с pom.

### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).
2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.
<p align="center">
  <img width="1200 height="600" src="./scr/mvn-package.png">
</p>

3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.
<p align="center">
  <img width="1200 height="600" src="./scr/mvn-repository.png">
</p>

4. В ответе пришлите исправленный файл `pom.xml`.\
**[pom.xml](./mvn/pom.xml)**

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
