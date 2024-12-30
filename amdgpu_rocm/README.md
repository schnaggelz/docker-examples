# Usage

Build and start the docker

````
docker compose build
docker compose up
````

and then if you need to attach

````
docker attach rocm_server
````

# Test llama.cpp

Assuming you want to offload 20 layers to the GPU:

## CLI

````
llama-cli --hf-repo "MaziyarPanahi/Llama-3.3-70B-Instruct-GGUF" --hf-file Llama-3.3-70B-Instruct.Q2_K.gguf -p "You are a helpful assistant" --conversation -ngl 20
````

# Server

````
llama-server --hf-repo "TheBloke/CodeLlama-34B-GGUF" --hf-file codellama-34b.Q2_K.gguf -ngl 64 --port 8080 --host 0.0.0.0
````
