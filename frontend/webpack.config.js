const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const webpack = require('webpack');
const path = require('path')

const MODE = "development";
const enabledSourceMap = MODE === "development";
const dist = path.resolve(__dirname, '../public/js/dist');

module.exports = {
    // モード値を production に設定すると最適化された状態で、
    // development に設定するとソースマップ有効でJSファイルが出力される
    mode: 'development',

    // メインとなるJavaScriptファイル（エントリーポイント）
    entry: {
        bundle: './src/es/main.js',
    },
    // ファイルの出力設定
    output: {
        //  出力ファイルのディレクトリ名
        // 出力ファイル名
        filename: '[name].js',
        path: dist,
        publicPath: 'http://localhost:8080/'
    },
    module: {
        rules: [
            {
                // 拡張子 .js の場合
                test: /\.js$/,
                use: [
                    {
                        // Babel を利用する
                        loader: 'babel-loader',
                        // Babel のオプションを指定する
                        options: {
                            presets: [
                                // プリセットを指定することで、ES2020 を ES5 に変換
                                '@babel/preset-env',
                            ],
                        }
                    },
                ]
            },
            {
                test: /\.(sa|sc|c)ss/,
                exclude: /node_modules/,
                use: [
                    // linkタグに出力する機能
                    MiniCssExtractPlugin.loader,
                    // CSSをバンドルするための機能
                    {
                        loader: "css-loader",
                        options: {
                            // オプションでCSS内のurl()メソッドの取り込みを禁止する
                            url: false,
                            // ソースマップの利用有無
                            sourceMap: enabledSourceMap,

                            // 0 => no loaders (default);
                            // 1 => postcss-loader;
                            // 2 => postcss-loader, sass-loader
                            importLoaders: 2
                        }
                    },
                    {
                        loader: "sass-loader",
                        options: {
                            // ソースマップの利用有無
                            sourceMap: enabledSourceMap
                        },
                    },
                ]
            }
        ]
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: 'css/bundle.css',  // /dist/css/sample.cssに出力
        }),
        new CleanWebpackPlugin(),
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: JSON.stringify(process.env.NODE_ENV),
            },
        }),
        new webpack.ProvidePlugin({
            $: 'jquery'
        })
    ],
    devServer: { // webpack-dev-serverの設定
        contentBase: '../public/js/dist',
    },
    // ES5(IE11等)向けの指定
    target: ["web", "es5"],
};