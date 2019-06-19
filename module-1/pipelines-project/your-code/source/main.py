import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

import acquisition
import wrangling
import analysis
import reporting


def read_file(file):
    my_data = acquisition.load_data(file)
    return my_data


def cleaning(my_data):
    my_data = wrangling.drop_null(my_data, 0.75)
    my_data = wrangling.split_column(my_data, 'Location')
    my_data = wrangling.rename_col(my_data, 'new_column', 'Country')
    my_data = wrangling.rename_col(my_data, 'new_column2', 'Regions')
    return my_data


def analyze(df):
    my_data = analysis.percent(df, 'Fatalities', 'Aboard')
    my_data = analysis.filter_col(my_data, 'Country')
    my_data = analysis.filter_data(my_data, 'Country')
    plot = analysis.draw_plot('Country', my_data)
    # my_data = reporting.change_null(df)
    return my_data, plot


def report(df, plot):

    my_data = reporting.download_csv(df)
    plot = reporting.download_plot(plot)
    return my_data, plot


def main():
    d = read_file('../input/Airplane_Crashes.csv')
    d_clean = cleaning(d)
    d_analyze, figure = analyze(d_clean)
    report(d_analyze, figure)


if __name__ == "__main__":
    main()




