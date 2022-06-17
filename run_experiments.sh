#!/bin/bash

ROT="--n_layers 2 --n_hiddens 100 --data_path data/ --log_every 100 --samples_per_task 1000 --dataset mnist_rotations    --cuda --log_dir logs/"
PERM="--n_layers 2 --n_hiddens 100 --data_path data/ --log_every 100 --samples_per_task 1000 --dataset mnist_permutations --cuda --log_dir logs/"
MANY="--n_layers 2 --n_hiddens 100 --data_path data/ --log_every 100 --samples_per_task 200 --dataset mnist_manypermutations --cuda --log_dir logs/"
CIFAR='--data_path data/ --log_every 100 --dataset cifar100 --cuda --log_dir logs/'
IMGNET='--data_path data/tiny-imagenet-200/ --log_every 100 --dataset tinyimagenet --cuda --log_dir logs/'
SEED=5

########## MNIST DATASETS ##########
##### La-MAML #####
# ROTATION

#gem
python3 main.py $ROT --model gem --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --glances 2 --lr 0.01 \
                    --memory_strength 0.0 --seed $SEED

#mer
python3 main.py $ROT --model meralg1 --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --lr 0.1 \
                    --beta 0.01 --gamma 1.0 --batches_per_example 5 --sync_update --use_old_task_memory --seed $SEED

#cmaml
python3 main.py $ROT --model lamaml --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --glances 5 --opt_lr 0.1 \
                    --opt_wt 0.1 --alpha_init 0.1 --sync_update --use_old_task_memory --seed $SEED

#lamaml
python3 main.py $ROT --model lamaml --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --glances 5 --opt_lr 0.3 \
                    --alpha_init 0.15 --learn_lr --use_old_task_memory --seed $SEED

#PERMUTATION

#gem
python3 main.py $PERM --model gem --memories 200 --batch_size 10 --replay_batch_size 10 --glances 2 --n_epochs 1 --lr 0.01 \
                    --memory_strength 0.0 --seed $SEED

#mer
python3 main.py $PERM --model meralg1 --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --lr 0.03 \
                    --beta 0.03 --gamma 1.0 --batches_per_example 10 --sync_update --use_old_task_memory --seed $SEED

#cmaml
python3 main.py $PERM --model lamaml --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --glances 5 --opt_wt 0.1 \
                    --alpha_init 0.03 --sync_update --use_old_task_memory --seed $SEED


#lamaml
python3 main.py $PERM --model lamaml --memories 200 --batch_size 10 --replay_batch_size 10 --n_epochs 1 --glances 5 --opt_lr 0.3 \
                    --alpha_init 0.15 --learn_lr --use_old_task_memory --seed $SEED

