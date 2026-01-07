enum ReputationHistoryType {
  askerAcceptsAnswer('asker_accepts_answer'),
  askerUnacceptAnswer('asker_unaccept_answer'),
  answerAccepted('answer_accepted'),
  answerUnaccepted('answer_unaccepted'),
  voterDownvotes('voter_downvotes'),
  voterUndownvotes('voter_undownvotes'),
  postDownvoted('post_downvoted'),
  postUndownvoted('post_undownvoted'),
  postUpvoted('post_upvoted'),
  postUnupvoted('post_unupvoted'),
  suggestedEditApprovalReceived('suggested_edit_approval_received'),
  postFlaggedAsSpam('post_flagged_as_spam'),
  postFlaggedAsOffensive('post_flagged_as_offensive'),
  bountyGiven('bounty_given'),
  bountyEarned('bounty_earned'),
  bountyCancelled('bounty_cancelled'),
  postDeleted('post_deleted'),
  postUndeleted('post_undeleted'),
  associationBonus('association_bonus'),
  arbitraryReputationChange('arbitrary_reputation_change'),
  voteFraudReversal('vote_fraud_reversal'),
  postMigrated('post_migrated'),
  userDeleted('user_deleted'),
  exampleUpvoted('example_upvoted'),
  exampleUnupvoted('example_unupvoted'),
  proposedChangeApproved('proposed_change_approved'),
  docLinkUpvoted('doc_link_upvoted'),
  docLinkUnupvoted('doc_link_unupvoted'),
  docSourceRemoved('doc_source_removed'),
  suggestedEditApprovalOverridden('suggested_edit_approval_overridden');

  final String value;

  const ReputationHistoryType(this.value);

  static ReputationHistoryType fromString(String value) {
    return ReputationHistoryType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => ReputationHistoryType.arbitraryReputationChange,
    );
  }

  String toDisplayString() {
    return value
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
