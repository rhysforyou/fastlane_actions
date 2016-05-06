module Fastlane
  module Actions
    # Downloads Fabric frameworks
    class DownloadFabricFrameworksAction < Action
      @@kit_names = ["AWS Cognito", "Answers", "Appsee", "Crashlytics", "Digits Kit",
        "GameAnalytics", "Mapbox", "MoPub", "Nuance", "Optimizely", "PubNub",
        "Stripe", "Twitter"]

      def self.run(params)
        path = params[:path]

        sh "mkdir -p #{path}"
        download_framework("Fabric", params[:fabric], path)

        @@kit_names.each do |kit_name|
          option = self.parameterize(kit_name).intern
          if params[option]
            download_framework(kit_name.gsub(" ", ""), params[option], path)
          end
        end
      end

      def self.download_framework(name, version, base_path)
        sh "curl 'https://kit-downloads.fabric.io/cocoapods/#{name.downcase}/#{version}/#{name.downcase}.zip' -o #{base_path}/#{name}.zip"
        sh "rm -rf #{base_path}/#{name}"
        sh "unzip #{base_path}/#{name}.zip -d #{base_path}/#{name}"
        sh "rm #{base_path}/#{name}.zip"
      end

      def self.parameterize!(string, sep = '_')
        # Turn unwanted chars into the separator
        string.gsub!(/[^a-z0-9\-_]+/i, sep)
        unless sep.nil? || sep.empty?
          re_sep = Regexp.escape(sep)
          # No more than one of the separator in a row.
          string.gsub!(/#{re_sep}{2,}/, sep)
          # Remove leading/trailing separator.
          string.gsub!(/^#{re_sep}|#{re_sep}$/i, '')
        end
        string.downcase
      end

      def self.parameterize(string, sep = '_')
        self.parameterize!(string.dup, sep)
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Downloads Fabric frameworks"
      end

      def self.available_options
        kit_config_items = @@kit_names.map do |kit_name|
          FastlaneCore::ConfigItem.new(key: self.parameterize(kit_name).intern,
                                       env_name: "DOWNLOAD_FABRIC_#{kit_name.upcase}_VERSION",
                                       description: "Use #{kit_name} with the spcified version",
                                       optional: true)
        end

        return [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "DOWNLOAD_FABRIC_PATH",
                                       description: "The directory where frameworks will be downloaded",
                                       default_value: "./Frameworks"),
          FastlaneCore::ConfigItem.new(key: :fabric,
                                       env_name: "DOWNLOAD_FABRIC_FABRIC_VERSION",
                                       description: "Use Fabric with the spcified version"),
        ].concat(kit_config_items)
      end

      def self.authors
        ["rpowell"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
