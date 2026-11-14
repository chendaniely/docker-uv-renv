# Breast Cancer Predictor

  - author: Tiffany Timbers, Melissa Lee & Joel Ostblom
  - adapted to uv and Quarto by: Daniel Chen & Kehan Sky Sheng

Demo of a data analysis project for DSCI 522 (Data Science workflows); a
course in the Master of Data Science program at the University of
British Columbia.

## About

Here we attempt to build a classification model using the k-nearest
neighbours algorithm which can use breast cancer tumour image
measurements to predict whether a newly discovered breast cancer tumour
is benign (i.e., is not harmful and does not require treatment) or
malignant (i.e., is harmful and requires treatment intervention).
Our final classifier performed fairly well on an unseen test data set,
with F2 = 0.98
and an overall accuracy calculated to be 0.96. On the 171 test data cases,
it correctly predicted 168.
It incorrectly predicted 3 cases,
however these were false positives, predicting that a tumour is malignant
when in fact it is benign.
These kind of incorrect predictions could cause the patient
to undergo unnecessary treatment,
and as such we recommend further research to improve the model
before it is ready to be put into production in the clinic.

The data set that was used in this project is of digitized breast cancer
image features created by Dr. William H. Wolberg, W. Nick Street, and
Olvi L. Mangasarian at the University of Wisconsin, Madison (Street,
Wolberg, and Mangasarian 1993). It was sourced from the UCI Machine
Learning Repository (Dua and Graff 2017) and can be found
[here](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+\(Diagnostic\)),
specifically [this
file](http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data).
Each row in the data set represents summary statistics from measurements
of an image of a tumour sample, including the diagnosis (benign or
malignant) and several other measurements (e.g., nucleus texture,
perimeter, area, etc.). Diagnosis for each image was conducted by
physicians.

## Report

The final report can be found
[here](https://ubc-mds.github.io/DSCI_522_project-template-breast-cancer-predictor/reports/breast_cancer_predictor_report.html)
(HTML), or as a
[PDF](reports/breast_cancer_predictor_report.pdf).

## Usage

First time running the project,
install [uv](https://docs.astral.sh/uv/getting-started/installation/)
and [Quarto](https://quarto.org/docs/get-started/),
then run the following from the root of this repository
to create the virtual environment:

``` bash
uv sync
```

To run the analysis and render the report,
run the following from the root of this repository:

``` bash
uv run quarto render
```

The rendered report is written to
`reports/breast_cancer_predictor_report.html` and
`reports/breast_cancer_predictor_report.pdf`.

## Dependencies

- [uv](https://docs.astral.sh/uv/) (version 0.12 or higher)
- [Quarto](https://quarto.org/) (version 1.10 or higher)
- Python and packages listed in [`pyproject.toml`](pyproject.toml)
  (exact versions are locked in [`uv.lock`](uv.lock))

## License

The Breast Cancer Predictor report contained herein is licensed under the
[Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) License](https://creativecommons.org/licenses/by-nc-sa/4.0/).
See [the license file](LICENSE.md) for more information. If
re-using/re-mixing please provide attribution and link to this webpage.
The software code contained within this repository is licensed under the
MIT license. See [the license file](LICENSE.md) for more information.

## References

Dua, Dheeru, and Casey Graff. 2017. "UCI Machine Learning Repository."
University of California, Irvine, School of Information; Computer
Sciences. <http://archive.ics.uci.edu/ml>.

Street, W. Nick, W. H. Wolberg, and O. L. Mangasarian. 1993. "Nuclear
feature extraction for breast tumor diagnosis." In *Biomedical Image
Processing and Biomedical Visualization*, edited by Raj S. Acharya and
Dmitry B. Goldgof, 1905:861–70. International Society for Optics;
Photonics; SPIE. <https://doi.org/10.1117/12.148698>.
