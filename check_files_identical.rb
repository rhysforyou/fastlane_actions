module Fastlane
  module Actions
    # Downloads Fabric frameworks
    class CheckFilesIdenticalAction < Action
      def self.run(params)
        files = params[:files]
        system("cmp -s #{files[0]} #{files[1]}")
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Determine if files are identical"
      end

      def self.available_options
        return [
          FastlaneCore::ConfigItem.new(key: :files,
                                       description: "Files to compare",
                                       is_string: false)
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
