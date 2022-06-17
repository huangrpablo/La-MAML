# Studying gradient alignment in mitigating catastrophic forgetting for continual learning

#Environment configuration

>pip install -r requirements.txt

#Get the Available Datasets
To download the Minist dataset
> python get_data.py all

# How to run
1.First run the following command:
>chmod +x run_experiments.sh

2.To reproduce the experiment result
>./run_experiments.sh

## Citation

This repository is based on paper
```
@article{gupta2020maml,
  title={La-MAML: Look-ahead Meta Learning for Continual Learning},
  author={Gupta, Gunshi and Yadav, Karmesh and Paull, Liam},
  journal={arXiv preprint arXiv:2007.13904},
  year={2020}
}
```
and the code was modified from montrealrobotics's repository, credit to
```
@article{montrealrobotics,
  title={La-MAML},
  author={Gupta, Gunshi and Yadav, Karmesh and Paull, Liam},
  link={https://github.com/montrealrobotics/La-MAML},
  year={2020}
}
```
