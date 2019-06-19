
import pandas as pd


def change_null(df):
    return df.fillna('-')


def download_csv(df):
    return df.to_csv(r'../output/Pipelines.csv')

def download_plot(plot):
    return plot.figure.savefig('../output/Plot pipelines'+'.png')
