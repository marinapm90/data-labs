
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


def percent(df, col, column):
    df['percent'] = ((df[col]/df[column])*100)
    return df


def filter_col(df, col):
    crashes = df[col].value_counts()
    return crashes.index[:10]


def filter_data(df, col):
    col_filtered = filter_col(df, col)
    data_filtered = df[df[col].isin(col_filtered)]
    return data_filtered


def draw_plot(col, df):
    plot = sns.countplot(x=col, data=df)
    return plot
