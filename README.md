# ssg-example

```
docker run -it --rm -v $(pwd):/work -w /work -p 8080:8080 node:16 bash
```

```
npm install --global @gridsome/cli
test -d /work/mysite || gridsome create mysite
cd mysite
gridsome develop
gridsome build
```

dist ディレクトリに静的に生成されたファイルが出力される
