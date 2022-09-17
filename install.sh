curl https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt?alt=media > sd-v1-4.ckpt

sudo apt-get update
yes | sudo apt-get install python3.8

wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
chmod +x Anaconda3-2022.05-Linux-x86_64.sh
./Anaconda3-2022.05-Linux-x86_64.sh -b
~/anaconda3/bin/conda config --set auto_activate_base false
~/anaconda3/bin/conda init

git clone https://github.com/basujindal/stable-diffusion.git
cd stable-diffusion


mkdir -p models/ldm/stable-diffusion-v1/
mv $(cd ../ && pwd)/sd-v1-4.ckpt models/ldm/stable-diffusion-v1/model.ckpt

# ~/anaconda3/bin/conda env remove  -n ldm
~/anaconda3/bin/conda env create -f environment.yaml
source ~/anaconda3/etc/profile.d/conda.sh
conda activate ldm

python3 optimizedSD/optimized_txt2img.py --prompt "happy smurf in van gogh style" --H 512 --W 512 --seed 27 --n_iter 2 --n_samples 5 --ddim_steps 50 --precision full
conda deactivate
