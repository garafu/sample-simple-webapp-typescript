# Simple Webapp

簡単なTypeScriptで実装したWebアプリ

Docker のマルチステージビルドのサンプル

## ビルド

- 単一ステージビルド

    ```
    docker build --tag webapp:single --file ./Dockerfile.single .
    ```

- マルチステージビルド

    ```
    docker build --tag webapp:multi .
    ```

## 実行

- 単一ステージビルド

    ```
    docker run -d --name webapp -p 3000:3000 webapp:single
    ```

- マルチステージビルド

    ```
    docker run -d --name webapp -p 3000:3000 webapp:multi
    ```

## イメージ容量の確認

```
docker images
```

実行結果のサンプル

```
$> docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
webapp        single    321f259193e8   11 seconds ago   1.14GB
webapp        multi     d576a1d823bc   29 minutes ago   177MB
alpine        latest    324bc02ae123   5 weeks ago      7.8MB
```