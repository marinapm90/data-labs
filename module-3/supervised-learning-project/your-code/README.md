
## Predicción Precio Coches.

Este proyecto consiste en una competición de Kaggel en la que tratamos de predecir el precio de los coches.

Para ello voy a mostrar la limpieza y los modelos que mejor me han funcionado.

He utilizado las siguientes funciones para limpiar los datos:

*def drop_column(df, to_drop):*
    *df.drop(to_drop,axis = 1, inplace = True)*

*def datos_dummies(df,column):*
    *cars_dummies = pd.get_dummies(df,column)*
    *return cars_dummies*



**Modelo 1: EL QUE MEJOR ME HA FUNCIONADO**

Limpieza de las columnas:

*column=['Id','county_fips','county_name','state_fips','state_code','state_name','city','manufacturer','odometer','title_status','paint_color','lat','long','transmission','make']*
*drop_column(cars,column)*

Get dummies en las columnas:

*column=['condition','cylinders','fuel','drive','size','type']*
*cars_dummies = datos_dummies(cars,column)*

Utilización del modelo ElasticNet:

*from sklearn.linear_model import ElasticNet*

*regr = ElasticNet(random_state=0)*
*regr.fit(X_train, y_train)*


**Modelo 2:**


Limpieza de columnas:

*column =['Id','county_fips', 'county_name','state_fips', 'state_code', 'state_name', 'weather','city','make','manufacturer']*
*drop_column(cars,column)*

Get Dummies:

*column=['condition','cylinders','fuel','title_status','transmission','drive','size','type','paint_color']*
*cars_dummies = datos_dummies(cars,column)*

Utilización del modelo ElasticNet:

*from sklearn.linear_model import LinearRegression*
*reg = LinearRegression()*
*reg= reg.fit(X_train, y_train)*

**Modelo 3:**

Limpieza de datos:

*column =['Id','county_fips', 'county_name','state_fips','state_code','state_name','city','make','manufacturer','title_status','lat', 'long']*
*drop_column(cars,column)*

*column=['condition','cylinders','fuel','transmission','drive','size','type','paint_color']*
*cars_dummies = datos_dummies(cars,column)*

Utilización del modelo RandomForestRegressor:

*from sklearn.ensemble import RandomForestRegressor*
*from sklearn.datasets import make_regression*

*X, y = make_regression(n_features=4, n_informative=2, random_state=0, shuffle=False)*
*regr = RandomForestRegressor(max_depth=2, random_state=0, n_estimators=100)*
*regr.fit(X_train, y_train)*


**Modelo 4: EL MÁS AUTOMÁTICO**

Limpieza de datos:

*to_drop =['year','Id','county_fips', 'county_name','state_fips', 'state_code','city', 'state_name','manufacturer', 'title_status','lat','long','transmission','make','paint_color']*


Get dummies:

*column=['condition','cylinders','fuel','drive','size','type']*

Utilización de StandarScaler:

*from sklearn.preprocessing import StandardScaler*
*scaler = StandardScaler()*
*scaler.fit(X_train,y_train)*

*scaler.mean_*

*X_new = scaler.transform(X_train)*

Utilización del modelo ElasticNet otra vez:

*from sklearn.linear_model import LinearRegression*
*reg = LinearRegression()*
*reg= reg.fit(X_train, y_train)*


Con este ultimo, cambiando los datos de las columnas que quiero limpiar y del modelo que quiero utilizar todo lo demás es "automático"

También he utilizado el MSE para conocer el score que me está dando ese modelo.

Primero spliteando el dataset de train:

*from sklearn.model_selection import train_test_split*

*X_train, X_test, y_train, y_test = train_test_split(X, y, test_size= 0.10,random_state = 5)*

Y despues utilizando la función de Mean Square Error:

*from sklearn.metrics import mean_squared_error*

*mean_squared_error(y_test, y_pred)*

