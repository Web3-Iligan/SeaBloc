import type { NextConfig } from "next";
import dfxWebpackConfig from "./dfx.webpack.config.mjs";
import webpack from 'webpack'

dfxWebpackConfig.initCanisterIds();

const EnvPlugin = new webpack.EnvironmentPlugin({
  DFX_NETWORK: 'local'
});

const nextConfig: NextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: false 
  },

  webpack: (config, { buildId, dev, isServer, defaultLoaders, webpack }) => {
    config.plugins.push(EnvPlugin);

    return config;
  },
  output: 'export'
};

export default nextConfig;
