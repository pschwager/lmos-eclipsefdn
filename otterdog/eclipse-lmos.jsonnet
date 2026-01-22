local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local defaultBranchRuleset() = 
  orgs.newRepoRuleset("default") {
    include_refs+: [
      "~DEFAULT_BRANCH"
    ],
    required_pull_request+: {
      required_approving_review_count: 1,
      dismisses_stale_reviews: true,
      requires_code_owner_review: true,
    },
    requires_linear_history: true,
    bypass_actors+: [
      "#Write",
    ],
  };

orgs.newOrg('technology.lmos', 'eclipse-lmos') {
  settings+: {
    description: "Eclipse LMOS",
    has_discussions: true,
    discussion_source_repository: "eclipse-lmos/lmos-demo"
  },
  secrets+: [
    orgs.newOrgSecret('GPG_KEY_ID') {
      value: "pass:bots/technology.lmos/gpg/key_id",
    },
    orgs.newOrgSecret('GPG_SUBKEY_ID') {
      value: "pass:bots/technology.lmos/gpg/subkey_id",
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/technology.lmos/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: "pass:bots/technology.lmos/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('LMOS_BOT_TOKEN') {
      value: "pass:bots/technology.lmos/github.com/token-hd5700",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/technology.lmos/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/technology.lmos/central.sonatype.org/token-username",
    },
    orgs.newOrgSecret('PROJECTS_STORAGE_PRIVATE_KEY') {
      value: "pass:bots/technology.lmos/projects-storage.eclipse.org/id_rsa",
    },
    orgs.newOrgSecret('PROJECTS_STORAGE_PASSPHRASE') {
      value: "pass:bots/technology.lmos/projects-storage.eclipse.org/id_rsa.passphrase",
    },
    orgs.newOrgSecret('PROJECTS_STORAGE_PUBLIC_KEY') {
      value: "pass:bots/technology.lmos/projects-storage.eclipse.org/id_rsa.pub",
    },
    orgs.newOrgSecret('PROJECTS_STORAGE_USERNAME') {
      value: "pass:bots/technology.lmos/projects-storage.eclipse.org/username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      has_wiki: false,
    },
    orgs.newRepo('arc') {
      actions_can_approve_pull_request_reviews: true,
      allow_auto_merge: true,
      description: "The Arc project utilizes the power of Kotlin DSL and Kotlin Scripting to define a language optimized for building LLM-powered solutions.",
      has_wiki: false,
      has_discussions: true,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('arc-spring-init') {
      actions_can_approve_pull_request_reviews: true,
      allow_auto_merge: true,
      description: "A demo project for the Arc Agent Framework",
      has_wiki: false,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('arc-view') {
      actions_can_approve_pull_request_reviews: true,
      allow_auto_merge: true,
      description: "Arc View is a UI application for Arc agents",
      has_wiki: false,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-router') {
      actions_can_approve_pull_request_reviews: true,
      allow_auto_merge: true,
      description: "Efficient Agent Routing with SOTA Language and Embedding Models",
      has_wiki: false,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-operator') {
      actions_can_approve_pull_request_reviews: true,
      allow_auto_merge: true,
      description: "The LMOS Operator is a Kubernetes operator designed to dynamically resolve Channel requirements based on the capabilities of installed Agents within a Kubernetes cluster.",
      has_wiki: false,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-kotlin-sdk') {
      description: "The LMOS Kotlin SDK to develop WoT-enabled Agents.",
      has_wiki: false,
      has_discussions: true,      
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-kotlin-sdk-template') {
      description: "Quick start template project for LMOS Kotlin SDK.",
      has_wiki: false,
      has_discussions: false,      
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-runtime') {
      actions_can_approve_pull_request_reviews: true,
      allow_auto_merge: true,
      description: "The LMOS Runtime facilitates dynamic agent routing and conversation handling in a multi-tenant, multi-channel environment.",
      has_wiki: false,
      has_discussions: true,      
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-demo') {
      description: "An LMOS demo using dev containers",
      has_wiki: false,
      has_discussions: true,     
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-sample-agents') {
      description: "Sample agents for deploying to an LMOS instance",
      has_wiki: false,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('lmos-cli') {
      description: "The command line interface for LMOS",
      has_wiki: false,
      rulesets: [
        defaultBranchRuleset()
      ],
    },
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "LMOS Website",
      has_wiki: false,
      homepage: "https://eclipse.dev/lmos",
      default_branch: "source",
      rulesets: [
        defaultBranchRuleset()
      ],
    },
  ],
}
