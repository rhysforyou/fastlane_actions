module Fastlane
  module Actions
    # Downloads Fabric frameworks
    class DownloadIntercomFrameworkAction < Action

      def self.run(params)
        path = params[:path]

        sh "mkdir -p #{path}"
        sh "curl 'https://codeload.github.com/intercom/intercom-ios/zip/master' -o #{path}/Intercom.zip"
        sh "rm -rf #{path}/Intercom"
        sh "unzip #{path}/Intercom.zip -d #{path}"
        sh "mv #{path}/intercom-ios-master #{path}/Intercom"
        sh "rm #{path}/Intercom.zip"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Downloads Intercom"
      end

      def self.available_options
        return [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "DOWNLOAD_INTERCOM_PATH",
                                       description: "The directory where Intercom will be downloaded",
                                       default_value: "./Frameworks"),
        ]
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
