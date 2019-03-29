# haskell-scratch

Base Docker image which includes minimal shared libraries for GHC-compiled executables.
For more information, see [Haskell Web Server in a 5MB Docker Image](https://www.fpcomplete.com/blog/2015/05/haskell-web-server-in-5mb).

I put all necessary files under **root** directory. 

To build the image:

- run ```make``` to build **integer-gmp and integer-simple** images
- make sure that you are logged into a docker registry. default registry in make file is dockerhub.
- run ```make push``` to push image with tags **integer-gmp**, **integer-simple** and **latest** as **integer-simple**. ```make push``` pushes image to **skydome** dockerhub account, feel free to change before pushing.

A sample **Dockerfile** using **skydome/haskell-scratch** image:

```
FROM skydome/haskell-scratch:integer-gmp

COPY ./mybinary /bin/
```

