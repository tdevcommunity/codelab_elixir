# codelab_elixir

Formateur: AMEGBLEAME Komlanvi Crédo  
Contenu: Code du codeLab sur les bases d'Elixir  
Date: 05/06/2021

Instructions to run the code
--

Links to install `Elixir`:

windows: https://elixir-lang.org/install.html#windows  
Linux: https://elixir-lang.org/install.html#gnulinux  
MacOs: https://elixir-lang.org/install.html#macos  

After installing `Elixir` on your machine go inside the root of this project.  

To showcase the Server example follow these steps: 
  1) Compile the file `server.exs` and get into the interactive elixir console:  
`iex server.exs` 
  2) Define a request variable (you can find some examples at the top of the Server module definition inside server.exs)
```
request = """
GET /pays HTTP/1.1
Host: server.com
User-Agent: Chrome/1.0
Accept: */*

"""
```
  3) Run the server to see the response
`Server.handle(request)`  
     