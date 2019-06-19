
import pandas as pd


def drop_null(df, percent):
    for column in df:
        result = (df[column].isnull().sum()/len(df))
        if result >= percent:
            del df[column]
    return df


def split_column(df, col):
    df['new_column'] = df[col].str.split(',').str[-1]
    df['new_column2'] = df[col].str.split(',').str[0]
    return df


def rename_col(df, col, new_name):

    df.rename(columns={col: new_name}, inplace=True)
    return df


